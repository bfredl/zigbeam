const std = @import("std");
const dbg = @import("std").debug.print;

const W = @TypeOf(std.io.getStdOut().writer());
const I = i32;
const RGB = struct { r: I, g: I, b: I };

fn do_colors(w: W, rgb: RGB) !void {
    try w.print("\x1b[38;2;{};{};{}m", .{ rgb.r, rgb.g, rgb.b });
}

fn reset(w: W) !void {
    try w.print("\x1b[0m", .{});
}

pub fn main() !void {
    const w = std.io.getStdOut().writer();
    dbg("is do debuggy things\n", .{});
    const rgb = .{ .r = 100, .g = 140, .b = 255 };
    try do_colors(w, rgb);
    try w.print("jamenhahåå {} \n", .{"gröt"});
    try reset(w);
}

// not a modeline, but a mapping:
// noremap <Plug>ch:ir <cmd>update<cr><cmd>call chansend(ww, "time zig build race\n")<cr>
