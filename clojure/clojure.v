module main

[heap]
struct Window {
	on_resize fn ()
	on_click  fn ()
}

[heap]
struct App {
mut:
	window &Window
}

fn main() {
	mut app := &App{
		window: &Window(0)
	}

	app.window = &Window{
		on_resize: app.method1
		on_click: app.method2
	}

	println('${@METHOD} | app: ${ptr_str(app)} | app.window: ${ptr_str(app.window)}')

	app.window.on_resize()
	app.window.on_click()
}

fn (mut app App) method1() {
	println('${@METHOD} | app: ${ptr_str(app)} | app.window: ${ptr_str(app.window)}')

	assert app.window != unsafe { nil }

	println('method1() ✅')
}

fn (app App) method2() {
	mut p := unsafe { &app }

	println('${@METHOD} | &app: ${ptr_str(p)} | app.window: ${ptr_str(app.window)}')

	assert app.window != unsafe { nil }

	println('method2() ✅')
}
