// Implementation of Wordle

const std = @import("std");
const word_list = @import("words.zig").words;

pub const GameState = struct {
    correct_word: [5]u8,
    guesses: [6][5]u8,
    gray_letters: [21]u8,
    yellow_lettters: [5]u8,
    green_letters: [5]u8,
};
