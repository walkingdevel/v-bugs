import vweb

struct App {
	vweb.Context
}

fn main() {
	vweb.run_at(&App{}, vweb.RunParams{
		port: 8080
	}) or { panic(err) }
}

['/']
pub fn (mut app App) index() vweb.Result {
	return $vweb.html()
}
