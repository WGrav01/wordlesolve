const words = @import("words.zig").words;

pub const Letters = struct {
    letter: [26]u8, // The letter itself
    frequency: [26][5]u32,
};

pub fn getInitialLetterCount() Letters {
    var letters = Letters{
        .letter = undefined,
        .frequency = [_][5]u32{[_]u32{0} ** 5} ** 26, // Init array with zeroes
    };

    for (0..letters.letter.len) |i| {
        letters.letter[i] = @as(u8, 'a') + @as(u8, @intCast(i));
    }

    for (words) |word| {
        inline for (0..5) |i| {
            const idx = word[i] - 'a';
            letters.frequency[idx][i] += 1;
        }
    }

    return letters;
}
