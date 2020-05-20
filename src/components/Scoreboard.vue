<template lang="html">
  <div class="scoreboard">
    <div class="header">
      <span>Scoreboard</span>
      <div class="player-input" v-if="this.players.length < 5">
       <label for="player-name">Player Name:</label>
       <input type="text" id="player-name" v-model="playerName"/>
       <button @click="addPlayer">Add Player</button>
      </div>
    </div>
    <div class="players-display">
      <div v-for="player in players" class="player-details">
        <input type="number">
       <h2> {{player}}  </h2>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'Scoreboard',
  data() {
    return {
      players: [],
      playerName: ""
    }
  },
  methods: {
    addPlayer: function () {
      this.players.push(this.playerName)
      this.playerName = ""
    }
  }
}
</script>

<style lang="css" scoped>
.scoreboard {
  position: fixed;
  left: 57vw;
  bottom: 20%;
  width: 40vw;
  height: 100px;
  background-color: lightgrey;
  padding: 0.5%;
}

.header {
  display: flex;
  justify-content: space-between;
}

.player-input {
  width: 60%;
  text-align: right;
}

.player-input button {
  padding: 0.5%;
}

.player-input input {
  width: 100px
}

.players-display {
  display: flex;
  height: 80px;
  width: 100%;
  margin: 0 auto;
}

.player-details {
  width: 20%;
  height: 80px;
  text-align: center;
  border: solid black 1px;
}

.player-details input {
  width: 40px;
  font-size: 1.5em;
}
</style>
