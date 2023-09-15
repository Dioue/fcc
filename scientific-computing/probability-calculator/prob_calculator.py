import copy
import random
import math
# Consider using the modules imported above.

class Hat:

    def __init__(self, **content: dict) -> None:
        self.list = copy.deepcopy(content)
        self.contents = []


        for key, value in self.list.items():
            self.contents.extend([key for i in range(value)])


    def draw(self, draw_count: int) -> list:
        if draw_count > len(self.contents):
            return self.contents  # Draw all available balls

        result = random.sample(self.contents, draw_count)
        for ball in result:
            self.contents.remove(ball)

        return result
    
    def count_list(self, sample: list) -> dict:
        res = dict()
        for itr in sample:
            res[itr] = res.get(itr, 0) + 1
        return res
    
    def refresh_draw(self, draw_count: int) -> list:
        if draw_count > len(self.contents):
            return self.contents  # Draw all available balls

        result = random.sample(self.contents, draw_count)
        return result    
    
    
def experiment(hat: Hat, expected_balls: dict, num_balls_drawn: int, num_experiments: int) -> float:
    evidence = 0

    for _ in range(num_experiments):
        drawn_balls_count = hat.count_list(hat.refresh_draw(num_balls_drawn))

        # Check if the drawn balls match the expected balls
        if all(drawn_balls_count.get(color, 0) >= count for color, count in expected_balls.items()):
            evidence += 1

    return (evidence / num_experiments)

""" def experiment(hat: object, expected_balls: dict, num_balls_drawn: int, num_experiments: int) -> float:

    # making a deepcopy of the hat object properties
    _list = copy.deepcopy(hat.list)
    _contents = copy.deepcopy(hat.contents)
    _sum = sum([val for val in _list.values()])

    # calculating binomial distribution
    expected_combination = {k: (math.factorial(num_balls_drawn) // (math.factorial(v) * math.factorial((num_balls_drawn - v)))) for k,v in expected_balls.items()}
    prob_ntimes = {k: ((_list.get(k)/_sum)**v) for k, v in expected_balls.items()}
    nprob_ntimes = {k: (((_sum - _list.get(k))/_sum)**(num_balls_drawn - v)) for k, v in expected_balls.items()}

    bin_dis = {k: (v*prob_ntimes.get(k)*nprob_ntimes.get(k)) for k, v in expected_combination.items()}

    single_iter_prob = sum([val for val in bin_dis.values()])

    return single_iter_prob """