const Builder = @import("std").build.Builder;
const mem = @import("std").mem;
const builtin = @import("builtin");

const print = @import("std").debug.print;

pub fn build(b: *Builder) void {
    const mode = b.standardReleaseOptions();

    var exe = b.addExecutable("zigbeam", "src/main.zig");
    exe.setBuildMode(mode);

    // exe.linkSystemLibrary("c");
    exe.install();

    const race = b.step("race", "race the beam");
    const run = exe.run();
    run.step.dependOn(b.getInstallStep());
    race.dependOn(&run.step);
}
