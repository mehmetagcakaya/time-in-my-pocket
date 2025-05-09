# 🕒 TimeInMyPocket

**Micro Time Management Application**  
Created by [Mehmet Ağcakaya](https://github.com/mehmetagcakaya) and [Mehmet Latif Kaya](https://github.com/mlatifkaya)

---

## 📌 Overview

In today's fast-paced world, "TimeInMyPocket" helps users reclaim lost moments throughout the day by identifying **micro-time slots** and turning them into opportunities for **productivity, learning, or relaxation**.

Inspired by real-life scenarios, this project detects patterns of time loss and offers **AI-powered personalized recommendations** that adapt to users' daily routines and habits.

---

## 💡 Features

- 📅 User-defined daily schedules and automatic detection of idle/wasted time  
- 🤖 AI-based recommendation engine with real-time adaptive suggestions  
- 🔐 Admin panel with control over AI parameters  
- 📊 Temporal data analysis and visualization  
- 🔄 Continuous feedback loop and learning  
- 💾 Secure and scalable database design  

---

## 🧠 How It Works

1. **User Input**: The user enters their work hours, commute times, and personal availability.
2. **Detection**: The app identifies micro-time gaps and time-wasting activities.
3. **AI Analysis**: Suggestions are generated such as:
   - Reading an article during a 10-minute bus ride
   - Practicing breathing exercises while waiting for lunch
   - Learning vocabulary during a traffic jam
4. **Adaptation**: If a suggestion is ignored, alternatives (e.g., switching an article with a podcast) are proposed the next day.
5. **Feedback**: Users provide feedback which trains the recommendation model further.

---

## 🧱 Database Schema

- `Users`
- `TimeLossActivities`
- `DailyTimeLossActivities`
- `AnalysisResults`
- `Recommendations`
- `UserPrompts`
- `PromptRecommendations`

Each table is optimized for performance, scalability, and clear relational integrity.

---

## 🔐 User Roles

- **Standard User**: Enters data, receives recommendations, gives feedback.
- **Admin**: Manages AI behavior, system parameters, and monitors performance.

---

## ✅ Functional Requirements

- Input daily schedule and preferences  
- Detect and log time-wasting activities  
- Generate and update recommendations  
- User feedback mechanism  
- Admin dashboard  

---

## 🛠️ Non-Functional Requirements

- High performance and scalability  
- Advanced temporal data handling  
- Security and data governance  
- Flexible JSON schema support  
- Seamless integration with Microsoft ecosystem  
- Backup and high availability  

---

## ⚠️ Constraints

- Users must have permission-enabled devices  
- Recommendation accuracy depends on feedback and AI training  
- Time detection relies on behavioral patterns and user honesty  

---

## 🚀 Technologies Used

- SQL Database (with JSON support)  
- AI Recommendation Engine  
- Microsoft Azure / Microsoft ecosystem support  
- Secure authentication and role-based access  

---

## 📈 Project Status

✅ Database schema complete  
✅ Core AI suggestion logic implemented  
🛠️ Future Improvements: Mobile App UI, Cloud Deployment, Gamification Features

---

## 🤝 Contributors

- Mehmet Ağcakaya 
- Mehmet Latif Kaya 

---

## 📬 Contact

For questions or contributions, feel free to reach out or open an issue!

---

