from enum import Enum

class Color(Enum):
  BLACK = '0'
  RED = '1'
  GREEN = '2'
  YELLOW = '3'
  BLUE = '4'
  MAGENTA = '5'
  CYAN = '6'
  WHITE = '7'

#      

class Powerline(Enum):
  ANGLE_FILLED = ''
  ANGLE_OPEN = ''
  BRANCH = ''

class PsBuilder:
  background = Color.BLACK
  foreground = Color.WHITE
  text = ''

  def bar(self, text, background=None, foreground=None):
    if self.text:
      self.change_color(foreground = self.background, background = background)
      self.text += Powerline.ANGLE_FILLED.value

    self.change_color(foreground = foreground, background = background)
    self.text += ' ' + text + ' '


  def change_color(self, background=None, foreground=None):
    inner = []
    
    if background != None and background != self.background:
      inner += '4' + background.value
      self.background = background

    if foreground != None and foreground != self.foreground:
      inner += '3' + foreground.value
      self.foreground = foreground

    if inner:
      self.text += '\033[' + ','.join(inner) + 'm'


  def build(self):
    return self.text + '\033[0m'


builder = PsBuilder()
builder.bar('Hello', background = Color.RED)
# print(builder.build())

class bcolors:
  WARNING = '\033[93m'
  ENDC = '\033[0m'

print bcolors.WARNING + "Warning" + bcolors.ENDC
