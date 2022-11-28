module main

import vweb
import users { get_all_users }

['/users']
pub fn (mut app App) users() vweb.Result {
	users := get_all_users(app.database)

	return $vweb.html()
}
