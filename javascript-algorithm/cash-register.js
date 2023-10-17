const checkCashRegister = (price, cash, cid) => {
    let balance = 0;
    cid.forEach(money => balance+= money[1]);


    let required_change = (cash - price) * 100;
    const denomination = [10000, 2000, 1000, 500, 100, 25, 10, 5, 1];

    //depository of money for cash in drawers
    let provided_cash = [
      ["ONE HUNDRED", 0], 
      ["TWENTY", 0], 
      ["TEN", 0], 
      ["FIVE", 0], 
      ["ONE", 0], 
      ["QUARTER", 0], 
      ["DIME", 0], 
      ["NICKEL", 0], 
      ["PENNY", 0],
    ];

    let CID = [...cid].reverse().map(el => [el[0], el[1] * 100]);
    if (balance === required_change / 100) {
    return {status: "CLOSED", change: [...cid]};
    } else for (let i = 0; i < CID.length; i++) {
      while (denomination[i] <= required_change && CID[i][1] > 0) {
        provided_cash[i][1] += denomination[i];
        required_change -= denomination[i];
        CID[i][1] -= denomination[i];
      }
    };
    
    let change = provided_cash.map(el => [el[0], el[1] / 100]).filter(el => el[1] !== 0); 
    let changeTotal = change.reduce((a, b) => (a + b[1]),0);
    if (changeTotal < required_change) {
        return {status: "INSUFFICIENT_FUNDS", change: []};
    }
    return {status: "OPEN", change};
};

checkCashRegister(3.26, 100, [["PENNY", 1.01], ["NICKEL", 2.05], ["DIME", 3.1], ["QUARTER", 4.25], ["ONE", 90], ["FIVE", 55], ["TEN", 20], ["TWENTY", 60], ["ONE HUNDRED", 100]])