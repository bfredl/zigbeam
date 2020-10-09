const std = @import("std");
const dbg = std.debug.print;
const wc2mb = std.unicode.utf8Encode;

const W = @TypeOf(std.io.getStdOut().writer());
const I = i32;
const RGB = struct { r: I, g: I, b: I };

fn do_colors(w: W, fg: bool, rgb: RGB) !void {
    const kod = if (fg) "3" else "4";
    try w.print("\x1b[{}8;2;{};{};{}m", .{ kod, rgb.r, rgb.g, rgb.b });
}

fn do_wc(w: W, wc: u21) !void {
    var x: [4]u8 = undefined;
    const len = try wc2mb(wc, x[0..x.len]);
    try w.writeAll(x[0..len]);
}

fn reset(w: W) !void {
    try w.print("\x1b[0m", .{});
}

pub fn main() !void {
    const w = std.io.getStdOut().writer();

    const rgb = .{ .r = 100, .g = 140, .b = 255 };
    try do_colors(w, true, rgb);
    try w.print("jamenhahåå {} \n", .{"gröt"});
    try reset(w);

    try do_colors(w, false, .{ .r = 000, .g = 100, .b = 50 });
    try do_wc(w, 1345);
    try w.print("\n", .{});

    try reset(w);
}

// not a modeline, but a mapping:
// noremap <Plug>ch:ir <cmd>update<cr><cmd>call chansend(ww, "time zig build race\n")<cr>
