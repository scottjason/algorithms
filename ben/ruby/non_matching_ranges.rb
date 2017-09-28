search = 'be'
target = 'betterbeabeer soup bea'

res = target.reverse.split(search.reverse)

slen = search.length
arr=[]
res.each do |e|
  idx = target.rindex(search+e.reverse) + slen
  arr << [idx, target.length-1]
  target = target.chomp(search+e.reverse)
end
