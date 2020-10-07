const std = @import("std");
const print = @import("std").debug.print;

pub fn main() !void {
    const stdout = std.io.getStdOut().writer();
    print("is do debuggy things\n", .{});
    try stdout.print("jamenhahåå {} \n", .{"gröt"});
}
