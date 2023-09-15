const palindrome = (str) =>{

    //test for non-alphanumeric characters using regex.
    let alpha = /[^a-z0-9]/gi;
    let checked = str.replace(alpha, '').toLowerCase();
  
    //create a copy of str as an array and reverse it
    const str_arr = [...checked];
    const reversed_arr = [...checked].reverse();
  
    //return if equals
  
    return str_arr.length === reversed_arr.length && str_arr.every((value, index) => value === reversed_arr[index]);
  }
  
  
  palindrome("A man, a plan, a canal. Panama");