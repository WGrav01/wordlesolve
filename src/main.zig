const std = @import("std");
const letter = @import("letter.zig");

pub fn main() !void {
    const stdout = std.io.getStdOut().writer();

    const letters = letter.getInitialLetterCount();

    try stdout.print("letter,first,second,third,fourth,fifth\n", .{});
    for (0..26) |i| {
        try stdout.print("{c},{d},{d},{d},{d},{d}\n", .{
            letters.letter[i],
            letters.first[i],
            letters.second[i],
            letters.third[i],
            letters.fourth[i],
            letters.fifth[i],
        });
    }
}
