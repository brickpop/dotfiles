#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
# Based on BackspaceBack.py https://github.com/riclc/nautilus_backspace
# originally by Ricardo Lenz riclc@hotmail.com
#

import os, gi
gi.require_version('Nautilus', '3.0')
from gi.repository import GObject, Nautilus, Gtk, Gio, GLib

def ok():
    app = Gtk.Application.get_default()
    app.set_accels_for_action( "view.select-all", ["<super>a"] )
    app.set_accels_for_action( "win.undo", ["<super>z"] )
    app.set_accels_for_action( "win.redo", [ "<shift><super>z" ] )
    app.set_accels_for_action( "view.cut", ["<super>x"] )
    app.set_accels_for_action( "view.copy", ["<super>c"] )
    app.set_accels_for_action( "view.paste", ["<super>v"] )

class KeybindingRemap(GObject.GObject, Nautilus.LocationWidgetProvider):
    def __init__(self):
        pass
    
    def get_widget(self, uri, window):
        ok()
        return None

