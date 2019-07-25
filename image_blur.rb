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

  def get_ones

    ones = []
    @image.each_with_index do |row, column|
      row.each_with_index do |item, item_index|
        if item == 1
          ones.push([item_index, column])
        end
      end
    end

    return ones

  end

  def image_transform

    row_max = @image[0].length - 1
    column_max = @image.length - 1

    ones = self.get_ones

    ones.each do |one|
      vert = one[1]
      horiz = one[0]

      unless vert == column_max
        @image[vert + 1][horiz] = 1
      end

      unless vert == 0
        @image[vert - 1][horiz] = 1
      end

      unless horiz == row_max
        @image[vert][horiz + 1] = 1
      end

      unless horiz == 0
        @image[vert][horiz - 1] = 1
      end

    end
  end

end

image = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 1, 1],
  [0, 0, 0, 0]
])

puts 'original image:'
image.output_image
image.image_transform
puts 'new image:'
image.output_image