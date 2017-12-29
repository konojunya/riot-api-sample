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
    import axios from 'axios'
    this.items = []

    // life cycle
    this.on("before-mount", async () => {
      const res = await axios.get("/api/article")
      this.items = res.data.articles
      this.update()
    })

    add() {
      const input = this.refs.input
      axios.post("/api/article", {
        text: input.value
      })
      .then((res) => {
        this.items = res.data.articles
        this.update()
        input.value = ""
      })
    }
    remove(e) {
      axios.delete(`/api/article/${e.item.item.id}`)
      .then((res) => {
        this.items = res.data.articles
        this.update()
      })
    }
  </script>
</todo>