class Image

  def initialize(image_content)
    @image = image_content
  end

  def output_image
    @image.each do |row|
      #why does this print each item out separately without the join function?
      puts row.join
    end
  end

  def image_transform

    # find each 1
    ones = []
    y = 0
    while y < @image.length
      @image.each do |row|
        y += 1
        if row.include?(1)
          x = row.index(1) + 1
          ones.push([x, y])
        end
      end
    end

    # do the actual transformation
    ones.each do |one|
      puts one.inspect
      if !(one[0] = @image[0].length)
        puts 'ok'
        @image[one[1]][one[0 + 1]] = 1
      elsif !(one[0] = 0)
        @image[one[1]][one[0 - 1]] = 1
      elsif not one[1] = @image.length
        @image[one[1] + 1][one[0]] = 1
      elsif not one[1] = 0
        @image[one[1] - 1][one[0]] = 1
      end

    end

  end

end

image = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
])

image.output_image
image.image_transform
puts '/'
image.output_image