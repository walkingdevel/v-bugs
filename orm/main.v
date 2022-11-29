module main

import sqlite

struct User {
	id       int    [primary; sql: serial]
	username string [unique]
}

fn main() {
	database := sqlite.connect(':memory:') or { panic(err) }

	users := sql database {
		select from User
	}

	print(users)
}
