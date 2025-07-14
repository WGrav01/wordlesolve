const words = @import("words.zig").words;
const Letters = @import("letter.zig").Letters;

pub fn findFirstWord(count: Letters) []const u8 {
    var current_best: []const u8 = undefined;
    var current_best_score: u32 = 0;
    for (words) |word| {
        var seen: u32 = 0;
        var has_duplicate = false;
        inline for (0..5) |i| {
            const idx = word[i] - 'a';
            if ((seen & (@as(u32, 1) << @as(u5, @intCast(idx)))) != 0) {
                has_duplicate = true;
                break;
            }
            seen |= (@as(u32, 1) << @as(u5, @intCast(idx)));
        }

        if (has_duplicate) continue; // skip words with duplicates

        // Score word
        var score: u32 = 0;
        inline for (0..5) |i| {
            const idx = word[i] - 'a';
            score += count.frequency[idx][i];
        }

        if (score > current_best_score) {
            current_best_score = score;
            current_best = word;
        }
    }

    return current_best;
}
