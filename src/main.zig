const std = @import("std");
const dbg = std.debug.print;
const wc2mb = std.unicode.utf8Encode;

const W = @TypeOf(std.io.getStdOut().writer());
const I = i32;
const RGB = struct { r: I, g: I, b: I };

fn doColors(w: W, fg: bool, rgb: RGB) !void {
    const kod = if (fg) "3" else "4";
    try w.print("\x1b[{s}8;2;{};{};{}m", .{ kod, rgb.r, rgb.g, rgb.b });
}

fn doWC(w: W, wc: u21) !void {
    var x: [4]u8 = undefined;
    const len = try wc2mb(wc, x[0..x.len]);
    try w.writeAll(x[0..len]);
}

fn reset(w: W) !void {
    try w.print("\x1b[0m", .{});
}

const TheFort = struct {
    const Self = @This();
    const DataList = std.ArrayList(i32);

    data: DataList,

    pub fn init(allocator: *std.mem.Allocator) Self {
        return Self{ .data = DataList.init(allocator) };
    }

    pub fn push(self: *Self, val: i32) !void {
        try self.data.append(val);
    }

    pub fn dup(self: Self) !void {
        self.data.append(val);
        aa;
    }
};

pub fn main() !void {
    const allocator = std.testing.allocator;
    const w = std.io.getStdOut().writer();
    var fort = TheFort.init(allocator);

    try fort.push(3);

    const rgb = .{ .r = 100, .g = 140, .b = 255 };
    try doColors(w, true, rgb);
    try w.print("jamenhahåå {s} \n", .{"gröt"});
    try reset(w);

    try doColors(w, false, .{ .r = 000, .g = 100, .b = 50 });
    try doWC(w, 1345);
    try w.print("\n", .{});

    try reset(w);
}

// not a modeline, but a mapping:
// noremap <buffer> <Plug>ch:ir <cmd>update<cr><cmd>call chansend(ww, "time zig build race\n")<cr>
