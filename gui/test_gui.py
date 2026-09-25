"""WS-C shell tests (pytest-qt, offscreen): navigation, validation,
toggles, compute wiring with a stubbed engine."""
import copy

import pytest
from PySide6.QtCore import Qt

import services
from gui.views import MainWindow
from test_render import DOC


@pytest.fixture
def window(qapp):
    win = MainWindow()
    win.show()
    return win


def _fill_valid(page):
    page.name_edit.setText("Test User")
    page.year.setValue(2000)
    page.month.setValue(8)
    page.day.setValue(17)
    page.hour.setValue(14)
    page.minute.setValue(5)
    page.city.setValue(7)


def test_starts_on_profile(window):
    assert window.stack.currentIndex() == 0
    assert window.profile.error_label.text() == ""


def test_invalid_birth_stays_with_errors(window, qtbot):
    page = window.profile
    _fill_valid(page)
    page.day.setValue(30)
    page.month.setValue(2)
    page.year.setValue(2001)
    qtbot.mouseClick(page.compute_btn, Qt.LeftButton)
    assert "non-leap year" in page.error_label.text()
    assert window.stack.currentIndex() == 0


def test_geo_toggle_follows_city(window):
    assert window.profile.geo_box.isEnabled() is False
    window.profile.city.setValue(27)
    assert window.profile.geo_box.isEnabled() is True


def test_thathkala_toggle_disables_birth(window):
    window.profile.thathkala.setChecked(True)
    assert window.profile.year.isEnabled() is False
    assert window.profile.city.isEnabled() is False
    window.profile.thathkala.setChecked(False)
    assert window.profile.year.isEnabled() is True


def test_compute_navigates_to_summary(window, qtbot, monkeypatch):
    doc = copy.deepcopy(DOC)
    monkeypatch.setattr(services, "compute", lambda **kw: doc)
    page = window.profile
    _fill_valid(page)
    qtbot.mouseClick(page.compute_btn, Qt.LeftButton)
    assert window.stack.currentIndex() == 1
    assert window.results.header_label.text() == "Test User"
    assert "2000-08-17" in window.results.sub_label.text()


def test_results_localize_values(window, qtbot, monkeypatch):
    doc = copy.deepcopy(DOC)
    monkeypatch.setattr(services, "compute", lambda **kw: doc)
    page = window.profile
    _fill_valid(page)
    page.locale.setCurrentText("si")
    qtbot.mouseClick(page.compute_btn, Qt.LeftButton)
    from i18n import trv

    assert trv("Thursday", "si", "weekdays") in window.results.sub_label.text()


def test_back_navigates(window, qtbot, monkeypatch):
    monkeypatch.setattr(services, "compute",
                        lambda **kw: copy.deepcopy(DOC))
    _fill_valid(window.profile)
    qtbot.mouseClick(window.profile.compute_btn, Qt.LeftButton)
    assert window.stack.currentIndex() == 1
    qtbot.mouseClick(window.results.back_btn, Qt.LeftButton)
    assert window.stack.currentIndex() == 0


def _computed(window, qtbot, monkeypatch, locale="en"):
    
    doc = copy.deepcopy(DOC)
    monkeypatch.setattr(services, "compute", lambda **kw: doc)
    page = window.profile
    _fill_valid(page)
    page.locale.setCurrentText(locale)
    qtbot.mouseClick(page.compute_btn, Qt.LeftButton)
    return doc


def test_results_tabs(window, qtbot, monkeypatch):
    _computed(window, qtbot, monkeypatch)
    tabs = window.results.tabs
    assert tabs.count() == 5
    assert window.results.matrix_table.model().data(
        window.results.matrix_table.model().index(0, 0)) == "Lagna"
    assert window.results.matrix_table.model().headerData(
        0, Qt.Horizontal) == "Graha"


def test_timeline_active_row_bold(window, qtbot, monkeypatch):
    _computed(window, qtbot, monkeypatch)
    model = window.results.dasa_table.model()
    assert model.data(model.index(0, 0)) == "Guru"
    assert model.data(model.index(2, 0)) == "Shani"
    assert model.data(model.index(2, 0), Qt.FontRole).bold() is True
    assert model.data(model.index(0, 0), Qt.FontRole) is None


def test_charts_gallery_loads_eight(window, qtbot, monkeypatch):
    _computed(window, qtbot, monkeypatch)
    widgets = window.results.chart_widgets
    assert len(widgets) == 8
    assert all(w.renderer().isValid() for w in widgets)
    assert window.results.hero_icon.renderer().isValid()


def test_matrix_headers_localize(window, qtbot, monkeypatch):
    from report_l10n import EXTRA_STRINGS

    _computed(window, qtbot, monkeypatch, locale="si")
    model = window.results.matrix_table.model()
    assert model.headerData(0, Qt.Horizontal) == EXTRA_STRINGS["Graha"][0]
    assert model.data(model.index(0, 0)) != "Lagna"
