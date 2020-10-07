const std = @import("std");
const print = @import("std").debug.print;

const T = @TypeOf(std.io.getStdOut().writer());

fn do_colors(w: T) !void {
    try w.print("\x1bx", .{});
}

pub fn main() !void {
    const w = std.io.getStdOut().writer();
    print("is do debuggy things\n", .{});
    try do_colors(w);
    try w.print("jamenhahåå {} \n", .{"gröt"});
}
