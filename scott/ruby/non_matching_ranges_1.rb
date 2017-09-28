# O(N2)

partial_term = 'eg'
full_term = 'eggwhites eggnog'

non_matching_ranges(partial_term, full_term)

def non_matching_ranges(partial_term, full_term)
  matching_start_indices = fetch_starting_indices_of_matches(partial_term, full_term)
  matching_ranges = fetch_matching_ranges(matching_start_indices, partial_term)
  fetch_non_matching_ranges(matching_ranges, full_term)
end

def fetch_starting_indices_of_matches(partial_term, full_term)
  len = partial_term.size
  (0..full_term.size - len).select { |i| full_term[i,len] == partial_term }
end

def fetch_matching_ranges(matching_indices, original_term)
  arr = []
  len = original_term.size
  matching_indices.each do |start_idx|
    end_idx = start_idx + (len - 1)
    arr << [start_idx, end_idx]
  end
  arr
end

def fetch_non_matching_ranges(matching_ranges, term)
  arr = []
  len = term.size
  matching_ranges.unshift([-1, -1])
  matching_ranges << [len, len]
  matching_ranges.each_with_index do |range, i|
    next unless matching_ranges[i + 1] && matching_ranges[i + 1][0] - 1 >= 0
    arr << [range[1] + 1,  matching_ranges[i + 1][0] - 1]
  end
  arr
end
