<!DOCTYPE html>
<html>
<head>
    <title>Posts</title>
</head>
<body>
    <h1>List of Posts</h1>
    <ul>
        @foreach($posts as $post)
            <li>{{ $post->title }}: {{ $post->body }}</li>
        @endforeach
    </ul>
</body>
</html>
