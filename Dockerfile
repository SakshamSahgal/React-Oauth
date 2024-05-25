# Use an official Node.js runtime as a base image (npm is included in this image)
FROM node:20

# fetch the latest version of the package lists
RUN apt-get update

# Set the working directory in the container
WORKDIR /app

# Copy all the contents of the Backend directory and put them in the container app directory
COPY Backend/ .

#copy Frontend Folder
COPY Frontend/ ./Frontend

#setting the working directory to the Frontend directory
WORKDIR /app/Frontend

#Run npm install in the Frontend directory
RUN npm install

#Run npm run build in the container app directory
RUN npm run build

# COPY the build folder from the Frontend directory to the app directory
RUN cp -r /app/Frontend/build /app/build

# Set the working directory in the container
WORKDIR /app

#delete the frontend directory
RUN rm -r /app/Frontend

# Install Node.js dependencies in the container app directory (backend)
RUN npm install


# Define build-time variables that users can pass to the builder with the docker build command using the --build-arg <varname>=<value> flag
ARG PORT
ARG CORS_ORIGIN

# Set environment variables using build-time variables
ENV PORT ${PORT}
ENV CORS_ORIGIN ${CORS_ORIGIN}

# expose the port 8000
EXPOSE 8000

# Run the Node.js application
CMD ["node", "src/index.js"]