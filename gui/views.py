"""Qt views: MainWindow + stacked pages (WS-C shell).

Profile form validates through services.validate_birth and emits
validated args; MainWindow computes via services.compute and shows a
summary built from services.hero_groups/hero_header (same objects
feed the HTML report). Full tables/charts arrive in WS-D.
"""
import sys

import services
from i18n import tr
from PySide6.QtCore import Signal
from PySide6.QtWidgets import (QCheckBox, QComboBox, QFormLayout,
                               QGroupBox, QHBoxLayout, QLabel, QLineEdit,
                               QMainWindow, QPushButton, QSpinBox,
                               QStackedWidget, QVBoxLayout, QWidget)


class ProfilePage(QWidget):
    """Birth-data form. Emits validated compute args on success."""

    submitted = Signal(dict)

    def __init__(self, parent=None):
        super().__init__(parent)
        form = QFormLayout(self)
        self.name_edit = QLineEdit()
        form.addRow(tr("Full Name", "en"), self.name_edit)
        self.year = self._spin(1000, 9999, 2000)
        form.addRow(tr("Birth year", "en"), self.year)
        self.month = self._spin(1, 12, 8)
        form.addRow(tr("Birth month", "en"), self.month)
        self.day = self._spin(1, 31, 17)
        form.addRow(tr("Birth day", "en"), self.day)
        self.hour = self._spin(0, 23, 14)
        form.addRow(tr("Birth hour", "en"), self.hour)
        self.minute = self._spin(0, 59, 5)
        form.addRow(tr("Birth minute", "en"), self.minute)
        self.city = self._spin(1, 99, 7)
        form.addRow(tr("District number", "en"), self.city)
        geo = QGroupBox(tr("Manual coordinates (district > 26)", "en"))
        geo_form = QFormLayout(geo)
        self.lat_deg = self._spin(0, 90, 6)
        geo_form.addRow(tr("Latitude degrees", "en"), self.lat_deg)
        self.lat_min = self._spin(0, 59, 37)
        geo_form.addRow(tr("Latitude minutes", "en"), self.lat_min)
        self.lon_deg = self._spin(0, 180, 80)
        geo_form.addRow(tr("Longitude degrees", "en"), self.lon_deg)
        self.lon_min = self._spin(0, 59, 24)
        geo_form.addRow(tr("Longitude minutes", "en"), self.lon_min)
        form.addRow(geo)
        self.geo_box = geo
        self.thathkala = QCheckBox(tr("Thathkala Kendra (time now)", "en"))
        form.addRow(self.thathkala)
        opts = QHBoxLayout()
        self.engine = QComboBox()
        self.engine.addItems(["swisseph", "dos"])
        self.method = QComboBox()
        self.method.addItems(["nirayana", "sayana"])
        self.locale = QComboBox()
        self.locale.addItems(["en", "si", "ta"])
        opts.addWidget(self.engine)
        opts.addWidget(self.method)
        opts.addWidget(self.locale)
        form.addRow(opts)
        self.compute_btn = QPushButton(tr("Compute horoscope", "en"))
        form.addRow(self.compute_btn)
        self.error_label = QLabel()
        self.error_label.setStyleSheet("color: red;")
        self.error_label.setWordWrap(True)
        form.addRow(self.error_label)
        self.birth_widgets = [self.name_edit, self.year, self.month,
                              self.day, self.hour, self.minute, self.city]
        self.city.valueChanged.connect(self._toggle_geo)
        self.thathkala.toggled.connect(self._toggle_thathkala)
        self.compute_btn.clicked.connect(self._on_compute)
        self._toggle_geo()
        self._toggle_thathkala(False)

    @staticmethod
    def _spin(lo, hi, val):
        box = QSpinBox()
        box.setRange(lo, hi)
        box.setValue(val)
        return box

    def _toggle_geo(self):
        self.geo_box.setEnabled(self.city.value() > 26)

    def _toggle_thathkala(self, checked):
        for w in self.birth_widgets:
            w.setEnabled(not checked)
        self.geo_box.setEnabled(not checked and self.city.value() > 26)

    def _geo_or_none(self, box):
        return box.value() if self.geo_box.isEnabled() else None

    def _on_compute(self):
        thathkala = self.thathkala.isChecked()
        args = {
            "name": self.name_edit.text(),
            "year": self.year.value(), "month": self.month.value(),
            "day": self.day.value(), "hour": self.hour.value(),
            "minute": self.minute.value(), "city": self.city.value(),
            "nirayana": self.method.currentText() == "nirayana",
            "engine": self.engine.currentText(),
            "locale": self.locale.currentText(),
            "lat_deg": self._geo_or_none(self.lat_deg),
            "lat_min": self._geo_or_none(self.lat_min),
            "lon_deg": self._geo_or_none(self.lon_deg),
            "lon_min": self._geo_or_none(self.lon_min),
            "thathkala": thathkala,
        }
        errors = services.validate_birth(
            args["name"], args["year"], args["month"], args["day"],
            args["hour"], args["minute"], args["city"], args["lat_deg"],
            args["lat_min"], args["lon_deg"], args["lon_min"], thathkala)
        if errors:
            self.error_label.setText(
                "\n".join(f"{k}: {v}" for k, v in errors.items()))
            return
        self.error_label.setText("")
        self.submitted.emit(args)


class ResultsPage(QWidget):
    """Summary built from shared hero data (full views land in WS-D)."""

    def __init__(self, parent=None):
        super().__init__(parent)
        layout = QVBoxLayout(self)
        self.header_label = QLabel()
        self.sub_label = QLabel()
        self.sub_label.setWordWrap(True)
        layout.addWidget(self.header_label)
        layout.addWidget(self.sub_label)
        self.groups_layout = QVBoxLayout()
        layout.addLayout(self.groups_layout)
        self.back_btn = QPushButton(tr("Back", "en"))
        layout.addWidget(self.back_btn)

    def show_doc(self, doc, locale):
        from services import hero_groups, hero_header

        name, sub = hero_header(doc, locale)
        self.header_label.setText(name)
        self.sub_label.setText(sub)
        while self.groups_layout.count():
            item = self.groups_layout.takeAt(0)
            if item.widget():
                item.widget().deleteLater()
        for title, items in (("Panchanga", hero_groups(doc, locale)["panchanga"]),
                             ("Hora", hero_groups(doc, locale)["hora"]),
                             ("Chakra", hero_groups(doc, locale)["chakra"])):
            box = QGroupBox(tr(title, locale))
            form = QFormLayout(box)
            for key, value in items:
                form.addRow(tr(key, locale), QLabel(str(value)))
            self.groups_layout.addWidget(box)


class MainWindow(QMainWindow):
    """Stacked navigation: profile form <-> results summary."""

    def __init__(self, parent=None):
        super().__init__(parent)
        self.setWindowTitle("STAR Horoscope")
        self.stack = QStackedWidget()
        self.setCentralWidget(self.stack)
        self.profile = ProfilePage()
        self.results = ResultsPage()
        self.stack.addWidget(self.profile)
        self.stack.addWidget(self.results)
        self.profile.submitted.connect(self._on_submitted)
        self.results.back_btn.clicked.connect(
            lambda: self.stack.setCurrentIndex(0))

    def _on_submitted(self, args):
        try:
            doc = services.compute(**args)
        except services.ServiceError as e:
            self.profile.error_label.setText(str(e))
            return
        self.results.show_doc(doc, args["locale"])
        self.stack.setCurrentIndex(1)


def running_frozen() -> bool:
    """True inside the PyInstaller bundle (used by future entry points)."""
    return getattr(sys, "frozen", False)
