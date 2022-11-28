module users

import sqlite

pub fn create_users_table(database sqlite.DB) {
	sql database {
		create table User
	}
}

pub fn create_user(database sqlite.DB, username string) {
	new_user := User{
		username: username
	}

	sql database {
		insert new_user into User
	}
}

pub fn get_all_users(database sqlite.DB) []User {
	return sql database {
		select from User
	}
}
