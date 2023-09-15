const rot13 = str => {
    const alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz'.split('');
    const cipher = 'NOPQRSTUVWXYZABCDEFGHIJKLMnopqrstuvwxyzabcdefghijklm'.split('');
    const result = [];
    for (let i = 0; i < str.length; i++) {
      const letter = str[i];
      if (alphabet.includes(letter)) {
        const index = alphabet.indexOf(letter);
        result.push(cipher[index]);
      } else {
        result.push(letter);
      }
    }
    return result.join('');
  };
  
  rot13("SERR PBQR PNZC");