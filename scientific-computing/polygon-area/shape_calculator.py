class Rectangle:

  def __init__(self, width: int = 0, height: int = 0) -> None:
    self.width = width
    self.height = height

  def get_area(self) -> int | float:
    return self.width * self.height

  def set_height(self, newHeight: int = None) -> None:
    if newHeight is not None:
      self.height = newHeight

  def set_width(self, newWidth: int = None) -> None:
    if newWidth is not None:
      self.width = newWidth

  def get_perimeter(self) -> int | float:
    return 2 * (self.height + self.width)

  def get_picture(self) -> str:
    if self.height * self.width > 50:
      return "Too big for picture."
    fmat = "\n".join([
        "".join(["*" for w in range(self.width)]) for h in range(self.height)
    ])
    return fmat + "\n"

  def __str__(self) -> str:
    return f"{self.__class__.__name__}(width={self.width}, height={self.height})"

  def get_diagonal(self):
    return (self.width**2 + self.height**2)**.5

  def get_amount_inside(self, sqr: object) -> int:
    return (self.width // sqr.width) * (self.height // sqr.height)


class Square(Rectangle):

  def __init__(self, length: int = 0) -> None:
    super(Square, self).__init__(height=length, width=length)

  def set_side(self, side: int) -> None:
    super(Square, self).set_height(side)
    super(Square, self).set_width(side)

  def set_height(self, newHeight: int) -> None:
    super(Square, self).set_height(newHeight)
    super(Square, self).set_width(newHeight)

  def set_width(self, newWidth: int) -> None:
    super(Square, self).set_height(newWidth)
    super(Square, self).set_width(newWidth)

  def __str__(self) -> str:
    return f"{self.__class__.__name__}(side={self.height})"
