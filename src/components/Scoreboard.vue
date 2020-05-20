<template lang="html">
  <div class="scoreboard">
    <span>Scoreboard</span>
    <div class="player-input" v-if="this.players.length < 5">
      <label for="player-name">Player Name:</label>
      <input type="text" id="player-name" v-model="playerName"/>
      <button @click="addPlayer">Add Player</button>
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
  left: 60%;
  bottom: 20%;
  width: 500px;
  height: 100px;
  background-color: lightgrey;
}

.players-display {
  display: flex;
  height: 70px;
  width: 95%;
  margin: 0 auto;
}

.player-details {
  width: 80px;
  height: 80px;
  text-align: center;
  border: solid black 1px;
}

.player-details input {
  width: 40px;
  font-size: 1.5em;
}
</style>
