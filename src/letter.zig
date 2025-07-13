const words = @import("words.zig").words;

pub const Letters = struct{
    letter: [26]u8, // The letter itself
    first: [26]u32, // How many times it appears as the first letter in a word
    second: [26]u32, // How many times it appears as the second letter in a word
    third: [26]u32, // How many times it appears as the third letter in a word
    fourth: [26]u32, // How many times it appears as the fourth letter in a word
    fifth: [26]u32, // How many times it appears as the fifth letter in a word
};

pub fn getFirstLetterCount() Letters {
    var letters = Letters{
        .letter = undefined,
        .first = [_]u32{0} ** 26,
        .second = [_]u32{0} ** 26,
        .third = [_]u32{0} ** 26,
        .fourth = [_]u32{0} ** 26,
        .fifth = [_]u32{0} ** 26,
    };

    for (0..letters.letter.len) |i| {
        letters.letter[i] = @as(u8, 'a') + @as(u8, @intCast(i));
    }

    for (words) |word| {
        inline for (0..5) |i| {
            const idx = word[i] - 'a';
            if (idx < 26) {
                switch (i) {
                    0 => letters.first[idx] += 1,
                    1 => letters.second[idx] += 1,
                    2 => letters.third[idx] += 1,
                    3 => letters.fourth[idx] += 1,
                    4 => letters.fifth[idx] += 1,
                    else => {},
                }
            }
        }
    }

    return letters;
}
