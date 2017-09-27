search = 'be'
target = 'betterbeabeer soup bea'

target.split(s)

res = target.reverse.split(s.reverse)

slen = search.length
arr=[]
res.each do |e|
  idx = target.rindex(search+e.reverse) + slen
  arr << [idx, target.length-1]
  target = str.chomp(search+e.reverse)
end
arr