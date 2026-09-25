"""Qt table models over shared services row data (WS-D).

All cell content comes from console/services.py (same objects feed
the HTML report); models only adapt rows/columns/headers/roles.
"""
import services
from PySide6.QtCore import QAbstractTableModel, Qt
from PySide6.QtGui import QFont


class _RowsModel(QAbstractTableModel):
    """Read-only string table over a list of row-dicts."""

    def __init__(self, headers, rows, parent=None):
        super().__init__(parent)
        self._headers = headers
        self._rows = rows

    def rowCount(self, parent=None):  # noqa: N802 (Qt API)
        return len(self._rows)

    def columnCount(self, parent=None):  # noqa: N802 (Qt API)
        return len(self._headers)

    def data(self, index, role=Qt.DisplayRole):  # noqa: N802 (Qt API)
        if not index.isValid():
            return None
        if role == Qt.DisplayRole:
            return str(self._rows[index.row()][index.column()])
        return None

    def headerData(self, section, orientation, role=Qt.DisplayRole):  # noqa: N802
        if role == Qt.DisplayRole and orientation == Qt.Horizontal:
            return self._headers[section]
        return None


def _cell_lists(rows, keys):
    return [[r[k] for k in keys] for r in rows]


def matrix_model(doc, locale="en", parent=None):
    """Shadvarga Matrix: planet/rasi+num/lon/nak/pada/5 vargas/avastha."""
    rows = []
    for r in services.matrix_rows(doc, locale):
        rows.append([r["planet"],
                     f"{r['rasi']}{services.sup(r['rasi_num'])}",
                     r["lon"], r["nakshatra"], str(r["pada"])] +
                    [f"{v['rasi']}{services.sup(v['num'])}"
                     for v in r["vargas"]] +
                    [r["avastha"]])
    return _RowsModel(services.matrix_headers(locale), rows, parent)


def houses_model(doc, locale="en", parent=None):
    """Houses table mirroring the terminal columns."""
    rows = []
    for r in services.houses_rows(doc, locale):
        rows.append([r["planet"], r["lon"], r["nakshatra"], r["pada"],
                     r["rasi"], r["rasi_lon"], r["avastha"]])
    return _RowsModel(services.houses_headers(locale), rows, parent)


def groups_model(items, parent=None):
    """Two-column key/value table (Panchanga/Hora/Chakra groups)."""
    return _RowsModel(["", ""], [[k, str(v)] for k, v in items], parent)


class TimelineModel(_RowsModel):
    """Flat dasa timeline (bhuktis indented); active rows bold."""

    def __init__(self, doc, detail=None, locale="en", parent=None):
        rows = []
        self._active = set()
        for s in services.timeline_rows(doc, detail, locale):
            rows.append([s["lord"], f"{s['from']} → {s['to']}", s["status"]])
            if s["active"]:
                self._active.add(len(rows) - 1)
            for b in s["bhuktis"]:
                rows.append([f"  └ {b['lord']}",
                             f"{b['from']} → {b['to']}", b["status"]])
                if b["active"]:
                    self._active.add(len(rows) - 1)
        super().__init__(services.timeline_headers(locale), rows, parent)

    def data(self, index, role=Qt.DisplayRole):  # noqa: N802 (Qt API)
        if (role == Qt.FontRole and index.isValid() and
                index.row() in self._active):
            font = QFont()
            font.setBold(True)
            return font
        return super().data(index, role)
