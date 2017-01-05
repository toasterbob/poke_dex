function cat(name, owner) {
  this.name = name;
  this.owner = owner;
}
cat.prototype.cuteStatement = function() {
  return `${this.owner} loves ${this.name}`;
};
const a = new cat('asd', 'sfsdf');
console.log(a.cuteStatement());

a.__proto__.cuteStatement = function() {
  return `Everyone loves ${this.name}`;
};
console.log(a.cuteStatement());
const b = new cat('fgsdgs', 'gjkrtj');
console.log(b.cuteStatement());

cat.prototype.meow = function() {
  console.log("Meow blah!");
};

a.meow = function () {
  console.log("Meow!");
};
a.meow();

b.meow();
