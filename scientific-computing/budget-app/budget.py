class Category:

    def __init__(self, split_names: str) -> None:
        self.category = split_names.title()
        self.ledger = []
        self.balance = 0

    def check_funds(self, amount: int) -> bool:
        if self.balance >= amount:
            return True
        
        return False
    
    def get_balance(self):
        return self.balance

    def deposit(self, amount: int, description: str = "") -> None:
        try:
            if isinstance(amount, (int, float)) and isinstance(description, str):
                self.ledger.append({"amount": amount, "description": description})
                self.balance+= amount
        except:
            print("Erorr: There must been an error to your inputs. Check if your input is correct.")
    
    def withdraw(self, amount: int, description: str = "") -> bool:
        try:
            if isinstance(amount, (int, float)) and self.check_funds(amount=amount) and isinstance(description, str):
                self.ledger.append({"amount": -abs(amount), "description": description})
                self.balance-= amount
                return True
            else:
                print("Insufficient balance")
                return False
        except:
            print("Erorr: There must been an error to your inputs. Check if your input is correct.")
            return False

    def transfer(self, transfer_amount: int, category: object) -> bool:
        try:
            if isinstance(transfer_amount, (int, float)) and self.check_funds(amount=transfer_amount) and isinstance(category, object):
                self.withdraw(amount=transfer_amount, description=f"Transfer to {category.category}")
                category.deposit(amount=transfer_amount, description=f"Transfer from {self.category}")
                return True
            return False    
        except:
            print("Erorr: There must been an error to your inputs. Check if your input is correct.")
        return False
    
    def __str__(self):

        # Calculation for field separator with category name
        len_category = len(self.category)
        field_calculation = (30 - len_category) // 2
        field_separator = ("*" * field_calculation) + self.category + ("*" * field_calculation)

        # Filtering ledger description for deposit and withdrawal
        ledger_amount = [f"{float(x['amount']):.2f}" for x in self.ledger]
        ledger_desc = [x['description'] for x in self.ledger]

        info_result = ""
        total = f"Total: {self.balance}"

        for i in range(len(self.ledger)):
            info_result+=f"\n{ledger_desc[i].ljust(23):.23}{str(ledger_amount[i]).rjust(7):.7}"
        

        return f"{field_separator}{info_result}\n{total}"

def create_spend_chart(categories):
    y_legend = [0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100]
    cat_names = [name.category for name in categories[:4]]
    max_cat_len = len(max(cat_names, key=len))
    split_names = ["  ".join([" " if len(li_cat) <= idx else li_cat[idx] for li_cat in cat_names]) for idx in range(max_cat_len)]
    x_legend = [names.rjust(13) for names in split_names]

    raw_percentile = {cat.category: abs((sum([x['amount'] for x in cat.ledger[1:]]) / cat.ledger[0]['amount']) * 100) for cat in categories[:4]}
    cat_percentile = {x: round(abs((raw_percentile[x]/sum([x for x in raw_percentile.values()])) * 100)) for x in raw_percentile}

    plot_format = {num: ["o" if amount >= num else " " for catper, amount in cat_percentile.items()] for num in reversed(y_legend)}
    line_break = " ".rjust(5) + "-" + "-"*(len(plot_format[0] * 3))

    result = []
    for percent, li in plot_format.items():
        result.append(f"{str(percent).rjust(4)}| " + "  ".join(li))
    result.append(line_break)
    
    print("\n".join(result) + "\n" + "\n".join(x_legend))