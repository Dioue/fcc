# Coded by JoeDev
# Notice: There was a lag during this code run, so I didn't check for the unittest passing.


def arithmetic_arranger(arg: str) -> str:

  if len(arg) > 5:
    return "Error: Too many problems."

  # Store as r-aligned strings
  operand1 = ""
  operand2 = ""
  drawline = ""
  result = ""

  problem_list = [x.split() for x in arg]

  for problem in problem_list:

    if problem[1] not in ["+", "-"]:
      return "Error: Operator must be '+' or '-'"
    elif not problem[0].isnumeric() and not problem[1].isnumeric():
      return "Error: Numbers must only contain digits."
    elif len(problem[0]) > 4 or len(problem[2]) > 4:
      return "Error: Numbers cannot be more than four digits."
    else:
      # find the longest length and use it as a basis for creating space
      longest_len = len(
          problem[0]) if len(problem[0]) >= len(problem[2]) else len(
              problem[2])

      operand1 += f"  {problem[0].rjust(longest_len)}\t"
      operand2 += f"{problem[1]} {problem[2].rjust(longest_len)}\t"
      lines = "-" * (longest_len + 2)
      drawline += f"{lines}\t"

      value = str(int(problem[0]) + int(problem[2]))
      sign = " " if problem[1] == "+" else "-"
      space_format = f"{sign}" if len(value) > longest_len else f" {sign}"

      result += f"{space_format}{value.rjust(longest_len) }\t"

  return f"{operand1}\n{operand2}\n{drawline}\n{result}"


print(arithmetic_arranger(["32 + 8", "1 - 3801", "9999 + 9999", "523 - 49"]))
