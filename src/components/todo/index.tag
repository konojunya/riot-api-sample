<todo>

  <div>
    <input ref="input" />
    <button onclick={ add }>追加</button>
  </div>

  <ul>
    <li each={item in items}>
      <p>{item.text}</p>
      <button onclick={ parent.remove }>&times;</button>
    </li>
  </ul>

  <style>
    li {
      display: flex;
      align-items: center;
    }
    li p {
      margin-right: 10px;
    }
    li button {
      background-color: white;
      width: 20px;
      height: 20px;
      border: 1px solid black;
    }
  </style>

  <script>
    this.items = {}

    add() {
      const input = this.refs.input
      const id = Math.random() * 10
      this.items[id] = {
        text: input.value,
        done: false
      }
      input.value = ""
    }
    remove(e) {
      console.log(e.item)
    }
  </script>
</todo>