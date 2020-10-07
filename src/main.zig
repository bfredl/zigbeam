const std = @import("std");
const dbg = @import("std").debug.print;

const W = @TypeOf(std.io.getStdOut().writer());

fn do_colors(w: W) !void {
    try w.print("\x1b[38;2;40;80;100m", .{});
}

pub fn main() !void {
    const w = std.io.getStdOut().writer();
    dbg("is do debuggy things\n", .{});
    try do_colors(w);
    try w.print("jamenhahåå {} \n", .{"gröt"});
}
// not a modeline, but a mapping:
// noremap <Plug>ch:ir <cmd>update<cr>:!time zig build race<cr>
