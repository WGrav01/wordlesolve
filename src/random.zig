const std = @import("std");
const words = @import("words.zig").words;

// Gets the base seed for the first word of the benchmark
pub inline fn getNewSeed() u64 {
    var random = std.rand.DefaultPrng.init(@as(usize, @intCast(std.time.timestamp())));
    return random.random().int(usize);
}

// Use FNV-1a to get a new seed from the old result, fast and suitable for generating a bunch of random words per second
pub inline fn deriveSeed(prevData: []const u8) u64 {
    var hash: u64 = 14695981039346656037;
    for (prevData) |b| {
        hash = (hash ^ b) * 1099511628211;
    }
    return hash;
}

// Gets a random starting word from a seed
pub inline fn getRandomStartingWord(seed: u64) []const u8 {
    var rng = std.rand.DefaultPrng.init(@as(usize, @intCast(seed))).random();
    return words[rng.uintLessThan(words.len)];
}
