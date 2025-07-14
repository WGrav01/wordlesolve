const std = @import("std");
const search = @import("search.zig");
const letter = @import("letter.zig");

pub fn main() !void {
    const stdout = std.io.getStdOut().writer();

    const letters = letter.getInitialLetterCount();

    try stdout.print("letter,first,second,third,fourth,fifth\n", .{});
    for (0..26) |i| {
        try stdout.print("{c},", .{letters.letter[i]});
        for (0..4) |j| {
            try stdout.print("{d},", .{letters.frequency[i][j]});
        }
        try stdout.print("\n", .{});
    }

    try stdout.print("{s}\n", .{search.findFirstWord(letters)});
}
