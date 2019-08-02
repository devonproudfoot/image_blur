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

  # replaced the image_transform method with blur, which will take the distance as an argument
  def blur(distance)
    row_max = @image[0].length() - 1
    column_max = @image.length() - 1

    ones = self.get_ones

    while distance > 0
      ones.each do |one|
        vert = one[1]
        horiz = one[0]
        # up 
        unless vert + distance > column_max
          @image[vert + distance][horiz] = 1
        end

        #down
        unless vert - distance < 0
          @image[vert - distance][horiz] = 1
        end

        # right
        unless horiz + distance > row_max
          @image[vert][horiz + distance] = 1
        end

        # left
        unless horiz - distance < 0
          @image[vert][horiz - distance] = 1
        end
      end

      distance -= 1
    end

  end

end

# baby image
image1 = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 1, 1],
  [0, 0, 0, 0]
])

# rectangular image
image2 = Image.new([
  [0, 0, 0, 0, 0, 1, 0, 0],
  [0, 1, 0, 0, 0, 0, 0, 0],
  [0, 0, 1, 1, 0, 0, 0, 1],
  [0, 0, 0, 0, 0, 0, 0, 0]
])

# monster image
image3 = Image.new([
  [0, 0, 0, 0, 0, 1, 0, 0],
  [0, 1, 0, 0, 0, 0, 0, 0],
  [0, 0, 1, 1, 0, 0, 0, 1],
  [0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 1, 0, 0],
  [0, 1, 0, 0, 0, 0, 0, 0],
  [0, 0, 1, 0, 0, 0, 0, 1],
  [0, 0, 0, 0, 0, 1, 0, 0]
])

puts 'original image 1:'
image1.output_image
image1.blur(2)
puts 'new image 1:'
image1.output_image

puts 'original image 2:'
image2.output_image
image2.blur(2)
puts 'new image 2:'
image2.output_image

puts 'original image 3:'
image3.output_image
image3.blur(2)
puts 'new image 3:'
image3.output_image

