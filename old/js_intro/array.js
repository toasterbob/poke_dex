Array.prototype.my_uniq = function() {
  let result = [];
  for (let i = 0; i < this.length; i++) {
    if (result.indexOf(this[i]) === -1) {
      result.push(this[i]);
    }
  }
  return result;
};


// let a = [1, 2, 1, 3, 3].my_uniq();
// console.log(a);


Array.prototype.my_twoSum = function() {
  let result = [];
  for (let i = 0; i < this.length; i++) {
    for (let l = i ; l < this.length; l++) {
      if (i === l) {
        continue;
      }
      if(this[i] + this[l] === 0) {
        result.push([i,l]);
      }
    }
  }
  return result;
};

// console.log([-1, 0, 2, -2, 1].my_twoSum());


Array.prototype.myTranspose = function() {
  const result = [];

  for (let i = 0; i<this[0].length; i++) {
    result.push(new Array(this.length));
  }

  for (var i = 0; i < this.length; i++) {
    for (var j = 0; j < this[i].length; j++) {
      result[j][i] = this[i][j];
    }

  }
  // let result = new Array(this[0].length. new Array(this.length))
  return result;
};

let cols = [
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8]
  ];
console.log(cols.myTranspose());
