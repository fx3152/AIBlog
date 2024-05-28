package com.example.demo.component;

import com.alibaba.druid.support.json.JSONUtils;
import okhttp3.*;
import cn.hutool.core.convert.ConvertException;
import cn.hutool.http.HttpException;
import cn.hutool.http.HttpRequest;
import cn.hutool.json.JSONArray;
import cn.hutool.json.JSONObject;
import cn.hutool.json.JSONUtil;
import lombok.experimental.UtilityClass;
import cn.hutool.json.JSONUtil;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.TimeUnit;

public class ChatGPTClient {
    private static final String API_URL = "https://api.chatanywhere.com.cn/v1/chat/completions";

    public static void main(String[] args) throws Exception {
//        OkHttpClient client = new OkHttpClient();

        String prompt = "My name is";
        String apiKey = "************************************"; //输入自己的key

        MediaType mediaType = MediaType.parse("application/json");

        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("model", "gpt-3.5-turbo");
        List<Map<String, String>> dataList = new ArrayList<>();
        dataList.add(new HashMap<String, String>(){{
            put("role", "user");
            put("content", "what is your name");
        }});
        paramMap.put("messages", dataList);

        String temp = new JSONObject(paramMap).toString();
        RequestBody body = RequestBody.create(mediaType, temp);

        Request request = new Request.Builder()
                .url(API_URL)
                .post(body)
                .addHeader("Authorization", "Bearer " + apiKey)
                .addHeader("Content-Type", "application/json")
                .build();

        OkHttpClient client = new OkHttpClient().newBuilder().connectTimeout(50000, TimeUnit.MILLISECONDS)
                .readTimeout(50000, TimeUnit.MILLISECONDS)
                .build();
        Response response = client.newCall(request).execute();
        String responseBody = response.body().string();
        JSONObject jsobj = JSONUtil.parseObj(responseBody);
        if (jsobj.get("choices") != null) {
            JSONArray choices = jsobj.getJSONArray("choices");
            JSONObject choice = choices.getJSONObject(0);
            String message = choice.getJSONObject("message").getStr("content");
            System.out.println(message);
        }
        System.out.println(responseBody);
    }
}