CREATE TYPE answer_type AS ENUM (
    'single-select',
    'multi-select',
    'rating',
    'boolean'
);

CREATE TYPE quiz_status AS ENUM (
    'incomplete',
    'complete',
    'in_progress',
    'cancelled'
);

CREATE TABLE Users (
    user_id CHAR(26) PRIMARY KEY,
    name TEXT,
    age_group TEXT,
    gender TEXT,
    health_goal TEXT
);

CREATE TABLE Quizzes (
    quiz_id SERIAL PRIMARY KEY,
    user_id CHAR(26) REFERENCES Users(user_id),
    status quiz_status NOT NULL DEFAULT 'incomplete',
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE UserResponses (
    response_id SERIAL PRIMARY KEY,
    quiz_id INTEGER REFERENCES Quizzes(quiz_id),
    question TEXT NOT NULL,
    answer_type answer_type NOT NULL,
    answer TEXT NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Recommendations (
    recommendation_id SERIAL PRIMARY KEY,
    quiz_id INTEGER REFERENCES Quizzes(quiz_id),
    product_recommendations JSONB,
    summary_of_responses TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);
