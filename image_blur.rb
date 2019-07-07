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

end

image = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
])

image.output_image