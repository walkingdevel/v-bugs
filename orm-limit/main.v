module main

import sqlite

const (
	const_users_offset     = 5
	const_users_offset_int = int(5)
)

struct User {
	id       int    [primary; sql: serial]
	username string [unique]
}

fn main() {
	database := sqlite.connect(':memory:') or { panic(err) }

	var_users_offset := 5

	// implicit declaration of function 'orm__int_literal_to_primitive' is invalid in C99
	_ := sql database {
		select from User offset const_users_offset
	}

	// compiles without errors
	_ := sql database {
		select from User offset const_users_offset_int
	}

	// compiles without errors
	_ := sql database {
		select from User offset var_users_offset
	}
}
