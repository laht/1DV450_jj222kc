collection @resource

node :test do |i|
	i.tags do |tag|
		{:test => tag.id}
	end
end

