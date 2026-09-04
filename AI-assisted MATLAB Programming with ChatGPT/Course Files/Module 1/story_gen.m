% Define a few sample folk tales as training data
stories = { ...
    'Once upon a time, there was a brave knight who fought a dragon.', ...
    'Long ago, a wise old man lived in a forest full of magical creatures.', ...
    'In a faraway kingdom, a young girl discovered a secret door to another world.', ...
    'In the deep sea, a little fish made friends with a big shark.', ...
    'In the heart of the ancient forest, a curious fox found a golden feather glowing in the moonlight.', ...
'Once in a village, there was a kind baker who could make bread that healed the sick.', ...
'A brave young prince ventured into the misty mountains to retrieve a stone that granted wishes.', ...
'At the edge of the world, a wise owl guarded secrets written in the stars.', ...
'Long ago, a fisherman cast his net and pulled out a mermaid who granted him three wishes.', ...
'Deep in the desert sands, a lost traveler stumbled upon a lamp with a sleeping genie.', ...
'An enchanted tree bore fruit that could make people invisible for a day.', ...
'A humble blacksmith crafted a magical sword that could speak and give advice.', ...
'In a distant kingdom, a lonely dragon guarded a castle filled with ancient books and scrolls.', ...
'Once every hundred years, a mountain opened to reveal a hidden city of crystal and light.'
    };

% Create a dictionary of bigram counts
bigram_counts = containers.Map();

for i = 1:length(stories)
    words = split(stories{i});  % Split the story into words
    for j = 1:length(words)-1
        key = words{j};
        next_word = words{j+1};
        
        % If the key is new, initialize with empty counts
        if ~isKey(bigram_counts, key)
            bigram_counts(key) = containers.Map();
        end
        
        % Retrieve the map of next words for the current key
        next_word_map = bigram_counts(key);
        
        % Increment count for the next_word following key
        if isKey(next_word_map, next_word)
            next_word_map(next_word) = next_word_map(next_word) + 1;
        else
            next_word_map(next_word) = 1;
        end
        
        % Update the bigram_counts with the modified next_word_map
        bigram_counts(key) = next_word_map;
    end
end

% Convert bigram counts to probabilities
bigram_probs = containers.Map();
keys = bigram_counts.keys;

for i = 1:length(keys)
    key = keys{i};
    following_words = bigram_counts(key);
    if isempty(values(following_words))
        total_count = 0;
    else
        total_count = sum(cell2mat(values(following_words)));
    end
    
    % Calculate probabilities for each following word
    word_probs = containers.Map();
    word_keys = following_words.keys;
    for j = 1:length(word_keys)
        word = word_keys{j};
        word_probs(word) = following_words(word) / total_count;
    end
    bigram_probs(key) = word_probs;
end

% Generate a new story with a starting word
start_word = 'Once';
generated_story = generate_story(bigram_probs, start_word, 20);
disp('Generated Story:');
disp(generated_story);

% Function to generate a story based on bigram probabilities
function story = generate_story(bigram_probs, start_word, max_length)
    story = start_word;
    current_word = start_word;
    
    for i = 1:max_length
        if isKey(bigram_probs, current_word)
            next_word_probs = bigram_probs(current_word);
            next_word = choose_next_word(next_word_probs);
            story = [story, ' ', next_word];
            current_word = next_word;
        else
            break;
        end
    end
end

% Helper function to choose the next word based on probabilities
function word = choose_next_word(word_probs)
    words = word_probs.keys;
    probs = cell2mat(values(word_probs));
    cumulative_probs = cumsum(probs);
    r = rand;
    
    % Select a word based on cumulative probability
    idx = find(r <= cumulative_probs, 1);
    word = words{idx};
end
