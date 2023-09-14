<template>
  <v-row justify="center" class="mb-10">
    <v-card
          class="mx-auto"
          max-width="500"
    >
      <v-card-item>
        <div>
          <div class="text-h6 mb-1">
            出欠入力
          </div>
          <v-radio-group
            v-model="attendance" >
            <v-radio label="出席" value="1"></v-radio>
            <v-radio label="欠席" value="0"></v-radio>
          </v-radio-group>

          <v-text-field
            v-model="reason"
            label="欠席理由"
            auto-grow
          ></v-text-field>

        </div>

        <div>
          {{ attendance }}
          {{ reason }}
        </div>
      </v-card-item>

      <v-card-actions>
        <v-btn @click="submit" variant="outlined">
          送信
        </v-btn>
      </v-card-actions>
    </v-card>
  </v-row>
</template>

<script>
  import axios from 'axios'

  export default {
    data: () => ({
      attendance: null,
      reason: "",
      response: "Flase"
    }),

    methods: {
      submit() {
        console.log([this.attendance, this.reason])
        axios.post(
          "http://127.0.0.1:8000/myapp/regist/", 
          {"child_id" : 1, "attendance" : this.attendance, "reason" : this.reason}
        )
        .then(res => {
          console.log(res);
          this.response = res;
        })
      }
    }
  }
</script>