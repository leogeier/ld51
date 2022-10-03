extends Node2D

var vertex

var current_plug

signal start_dragging
signal stopped_dragging

export(Color) var normal_col
export(Color) var hover_col
export(Color) var connected_col

func hover_with_plug(_plug):
	modulate = hover_col

func unhover_with_plug(_plug):
	modulate = normal_col

func insert_plug(plug):
	modulate = connected_col
	$RemoteTransform2D.remote_path = plug.get_path()
	current_plug = plug
	$PlugInsert.play()

func remove_plug(_plug):
	modulate = hover_col
	$RemoteTransform2D.remote_path = ""
	current_plug = null
	$PlugInsert.play()

func can_accept_plug():
	return current_plug == null
