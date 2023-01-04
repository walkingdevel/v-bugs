module main

fn task_with_big_memory_allocation(i int) {
	println('start of ${i}')

	a := []int{len: 5_000_000, init: 0}

	println('end of ${i}, ${a.len}')
}

fn main() {
	println('start')

	for i in 0 .. 10 {
		spawn task_with_big_memory_allocation(i)
	}

	println('end')
}
