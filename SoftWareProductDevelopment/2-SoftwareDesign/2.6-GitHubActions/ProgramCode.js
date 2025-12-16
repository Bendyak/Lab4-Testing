class User {
  constructor(username, incomeLevel) {
    this.username = username;
    this.incomeLevel = incomeLevel;
  }

  getUserInfo() {
    return `User ${this.username} has ${this.incomeLevel} income.`;
  }
}

const user = new User("Student1", "Medium");
console.log(user.getUserInfo());
