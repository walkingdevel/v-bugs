module users

import sqlite

fn test_create_user() {
	mut database := sqlite.connect(':memory:') or { panic(err) }

	defer {
		database.close() or { panic(err) }
	}

	create_users_table(database)

	create_user(database, 'test')

	users := get_all_users(database)
	user := users.first()

	assert users.len == 1
	assert user.username == 'test'
	assert user.id == 1
}
